import Foundation
import UIKit

final class NavigationBar: UIView {
    
    private static let NIB_NAME = "NavigationBar"
    
    @IBOutlet private var view: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rightButton: UIButton!
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(NavigationBar.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
}
