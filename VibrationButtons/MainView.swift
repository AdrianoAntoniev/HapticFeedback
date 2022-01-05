//
//  MainView.swift
//  VibrationButtons
//
//  Created by Adriano-R Vieira on 05/01/22.
//

import UIKit

class MainView: UIView {
    private var count = 0
    private lazy var button: UIButton = buildButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .orange

        setupHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup methods

private extension MainView {
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                button.centerYAnchor.constraint(equalTo: centerYAnchor),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                button.heightAnchor.constraint(equalToConstant: 100)
            ]
        )
    }

    func setupHierarchy() {
        addSubview(button)
    }
}

// MARK: - Build methods

private extension MainView {
    func buildButton() -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap here to vibrate", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .green
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapMe(_:)), for: .touchUpInside)

        return button
    }
}

// MARK: - Obj-C methods

private extension MainView {
    @objc func tapMe(_ sender: Any) {
        guard let btn = sender as? UIButton else { return }
        count += 1

        switch count {
        case 1:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            btn.setTitle("Notification error", for: .normal)

        case 2:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            btn.setTitle("Notification success", for: .normal)

        case 3:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
            btn.setTitle("Notification warning", for: .normal)

        case 4:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            btn.setTitle("Impact light", for: .normal)

        case 5:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            btn.setTitle("Impact medium", for: .normal)

        case 6:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            btn.setTitle("Impact heavy", for: .normal)

        case 7:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred(intensity: 1.0)
            btn.setTitle("Impact heavy Whoa", for: .normal)

        default:
            UISelectionFeedbackGenerator().selectionChanged()
            btn.setTitle("Selection changed", for: .normal)
            count = 0
        }
    }
}
