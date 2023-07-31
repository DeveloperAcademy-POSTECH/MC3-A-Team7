//
//  MainViewSheetView.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI
import UIKit

struct RecommendViewSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    @State var showAlert: Bool = false
    @State var isToggled: Bool = false
    @State var attempToDismiss = UUID()

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Accept", isOn: $isToggled)
            }
            .navigationBarItems(
                leading: Button("취소", action: {
                    if isToggled { showAlert.toggle() }
                    else { dismiss() }
                }),
                trailing: Button("저장", action: {})
            )
            .navigationBarTitle("기록하기", displayMode: .inline)
        }
        .presentationDetents([.height(UIScreen.main.bounds.height/3)])
        .presentationDragIndicator(.hidden)
        .interactiveDismissDisabled(isToggled, attempToDismiss: $attempToDismiss)
        .actionSheet(isPresented: $showAlert, content: getActionSheet)
        .onChange(of: attempToDismiss) { _ in
            showAlert.toggle()
        }
    }

    func getActionSheet() -> ActionSheet {
        let destructiveButton: ActionSheet.Button = .destructive(Text("나가기"), action: {dismiss()})
        let cancelButton: ActionSheet.Button = .cancel(Text("계속 기록하기"))
        let title = Text("기록이 저장되지 않았습니다. 나가시겠습니까?")

        return ActionSheet(title: title, buttons: [destructiveButton, cancelButton])
    }
}




struct SetSheetDelegate: UIViewRepresentable {
    let delegate:SheetDelegate

    init(isDisable:Bool,attempToDismiss:Binding<UUID>){
        self.delegate = SheetDelegate(isDisable, attempToDismiss: attempToDismiss)
    }

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            uiView.parentViewController?.presentationController?.delegate = delegate
        }
    }
}

final class SheetDelegate: NSObject, UIAdaptivePresentationControllerDelegate {
    var isDisable: Bool
    @Binding var attempToDismiss: UUID

    init(_ isDisable: Bool, attempToDismiss: Binding<UUID> = .constant(UUID())) {
        self.isDisable = isDisable
        _attempToDismiss = attempToDismiss
    }

    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        !isDisable
    }

    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        attempToDismiss = UUID()
    }
}

public extension View {
    func interactiveDismissDisabled(_ isDisable: Bool, attempToDismiss:Binding<UUID>) -> some View{
        background(SetSheetDelegate(isDisable: isDisable, attempToDismiss: attempToDismiss))
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self.next
        while parentResponder != nil {
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
            parentResponder = parentResponder?.next
        }
        return nil
    }
}
