import UIKit

class UserGroupHeaderView: UIView {

  private let titleLabel = UILabel()
  private let subtitleLabel = UILabel()
  private let separatorView = UIView()
  private let stackView = UIStackView()

  private static let contentInsets = UIEdgeInsets(
    top: 12, left: 16, bottom: 12, right: 16
  )

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(
      red: 0.1019607843,
      green: 0.1137254902,
      blue: 0.1294117647,
      alpha: 1
    )
    isOpaque = true

    titleLabel.font = UIFont(name: "Lato-Bold", size: 17)
    titleLabel.textColor = #colorLiteral(
      red: 0.8196078431,
      green: 0.8235294118,
      blue: 0.8274509804,
      alpha: 1
    )
    titleLabel.isOpaque = true

    subtitleLabel.font = UIFont(name: "Lato-Regular", size: 13)
    subtitleLabel.textColor = #colorLiteral(
      red: 0.7019607843,
      green: 0.7058823529,
      blue: 0.7137254902,
      alpha: 1
    )
    subtitleLabel.numberOfLines = 2
    subtitleLabel.isOpaque = true

    stackView.axis = .vertical
    stackView.alignment = .leading
    stackView.spacing = 4
    stackView.isOpaque = true
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(subtitleLabel)

    separatorView.backgroundColor = #colorLiteral(
      red: 0.8196078431,
      green: 0.8235294118,
      blue: 0.8274509804,
      alpha: 0.11
    )
    separatorView.isOpaque = true
    separatorView.translatesAutoresizingMaskIntoConstraints = false

    addSubview(stackView)
    addSubview(separatorView)

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(
        equalTo: topAnchor, constant: Self.contentInsets.top
      ),
      stackView.leadingAnchor.constraint(
        equalTo: leadingAnchor, constant: Self.contentInsets.left
      ),
      stackView.trailingAnchor.constraint(
        equalTo: trailingAnchor, constant: -Self.contentInsets.right
      ),
      stackView.bottomAnchor.constraint(
        equalTo: bottomAnchor, constant: -Self.contentInsets.bottom
      ),

      separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
      separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
      separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
      separatorView.heightAnchor.constraint(equalToConstant: 1)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with presentable: UserGroupHeaderPresentable) {
    titleLabel.text = "@\(presentable.handle)"
    subtitleLabel.text = "\(presentable.memberCount) members  |  \(presentable.description)"
  }
}
