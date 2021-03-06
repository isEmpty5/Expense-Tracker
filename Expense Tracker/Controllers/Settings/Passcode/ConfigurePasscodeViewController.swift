//
//  ConfigurePasscodeViewController.swift
//  Expense Tracker
//
//  Created by isEmpty on 23.12.2020.
//

import UIKit

final class ConfigurePasscodeViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet private weak var turnOnButton: RoundedGradientButton!
    @IBOutlet private weak var turnOffButton: RoundedGradientButton!
    @IBOutlet private weak var passcodePictureView: PasscodeWelcomeView!
    
    //MARK: - Properties
    private let appSettings = AppSettings.shared
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureButtons()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        passcodePictureView.setNeedsDisplay()
    }
    
    //MARK: - Actions
    @IBAction private func trurnOnTapped(_ sender: Any) {
        appSettings.isPasscodeEnabled ?
            pushViewController(with: .edit) : pushViewController(with: .create)
    }
    
    @IBAction private func turnOffTapped(_ sender: Any) {
        pushViewController(with: .disable)
    }
}

//MARK: - Supporting Methods
extension ConfigurePasscodeViewController {
    
    /// Shows the `EditPasscodeViewController` with the selected edit mode.
    /// - Parameter editingMode: The edit mode with which the viewController will open.
    private func pushViewController(with editingMode: EditPasscodeViewController.EditingMode) {
        let storyboard = UIStoryboard(name: Storyboards.editPasscode, bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() as? EditPasscodeViewController else { return }
        controller.editingMode = editingMode
        navigationController?.pushViewController(controller, animated: true)
    }
    
    /// Configures the display of `turnOnButton` and `turnOffButton`.
    /// If passcode is not set, then it will only be possible to enable it.
    /// If the passcode is enabled, it will be possible to edit and disable it.
    private func configureButtons(){
        if appSettings.isPasscodeEnabled {
            turnOnButton.setTitle("Change passcode".localized, for: .normal)
        } else {
            turnOffButton.isHidden = true
        }
    }
}
