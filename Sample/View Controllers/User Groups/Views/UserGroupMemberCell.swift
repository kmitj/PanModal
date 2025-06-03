import UIKit

class UserGroupMemberCell: UITableViewCell {

  private let avatarView = UIView()
  private let nameLabel = UILabel()
  private let roleLabel = UILabel()
  private let memberDetailsStackView = UIStackView()
  private let stackView = UIStackView()

  private static let contentInsets = UIEdgeInsets(
    top: 8.0, left: 16.0, bottom: 8.0, right: 16.0
  )
  private static let avatarSize = CGSize(width: 36.0, height: 36.0)

  private(set) var presentable = UserGroupMemberPresentable(
    name: "", role: "", avatarBackgroundColor: .black
  )

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    backgroundColor = #colorLiteral(
      red: 0.1019607843,
      green: 0.1137254902,
      blue: 0.1294117647,
      alpha: 1
    )
    isAccessibilityElement = true

    let bgView = UIView()
    bgView.isOpaque = true
    bgView.backgroundColor = #colorLiteral(
      red: 0.8196078431,
      green: 0.8235294118,
      blue: 0.8274509804,
      alpha: 0.11
    )
    selectedBackgroundView = bgView

    avatarView.isOpaque = true
    avatarView.layer.cornerRadius = 8.0
    avatarView.translatesAutoresizingMaskIntoConstraints = false

    nameLabel.isOpaque = true
    nameLabel.textColor = #colorLiteral(
      red: 0.8196078431,
      green: 0.8235294118,
      blue: 0.8274509804,
      alpha: 1
    )
    nameLabel.font = UIFont(name: "Lato-Bold", size: 17.0)
    nameLabel.backgroundColor = .clear

    roleLabel.isOpaque = true
    roleLabel.textColor = #colorLiteral(
      red: 0.7019607843,
      green: 0.7058823529,
      blue: 0.7137254902,
      alpha: 1
    )
    roleLabel.font = UIFont(name: "Lato-Regular", size: 13.0)
    roleLabel.backgroundColor = .clear

    memberDetailsStackView.axis = .vertical
    memberDetailsStackView.alignment = .leading
    memberDetailsStackView.isOpaque = true
    memberDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
    memberDetailsStackView.addArrangedSubview(nameLabel)
    memberDetailsStackView.addArrangedSubview(roleLabel)

    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.spacing = 16.0
    stackView.isOpaque = true
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(avatarView)
    stackView.addArrangedSubview(memberDetailsStackView)

    contentView.addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(
        equalTo: contentView.topAnchor, constant: Self.contentInsets.top
      ),
      stackView.leadingAnchor.constraint(
        equalTo: contentView.leadingAnchor, constant: Self.contentInsets.left
      ),
      stackView.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor, constant: -Self.contentInsets.right
      ),
      stackView.bottomAnchor.constraint(
        equalTo: contentView.bottomAnchor, constant: -Self.contentInsets.bottom
      ),
      avatarView.widthAnchor.constraint(equalToConstant: Self.avatarSize.width),
      avatarView.heightAnchor.constraint(equalToConstant: Self.avatarSize.height)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func setHighlighted(_ highlighted: Bool, animated: Bool) {
    super.setHighlighted(highlighted, animated: animated)
    avatarView.backgroundColor = presentable.avatarBackgroundColor
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    avatarView.backgroundColor = presentable.avatarBackgroundColor
  }

  func configure(with presentable: UserGroupMemberPresentable) {
    self.presentable = presentable
    nameLabel.text = presentable.name
    roleLabel.text = presentable.role
    avatarView.backgroundColor = presentable.avatarBackgroundColor
  }
}
