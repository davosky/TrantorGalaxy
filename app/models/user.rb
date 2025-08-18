class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable

  has_many :vehicles
  has_many :transports
  has_many :roads
  has_many :places
  has_many :structures
  has_many :reasons
  has_many :reimbursements

  mount_uploader :signature, SignatureUploader
  mount_uploader :validator_signature, ValidatorSignatureUploader
  mount_uploader :confirmator_signature, ConfirmatorSignatureUploader
  mount_uploader :institute_logo, InstituteLogoUploader

  before_create :set_id

  def set_id
    last_id = User.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :first_name, :last_name, :gender, :category, :region, :province, :institute, :office, :validator, :validator_presentation, :confirmator, :confirmator_presentation, presence: true

  validates_integrity_of :signature, :validator_signature, :confirmator_signature
  validates_processing_of :signature, :validator_signature, :confirmator_signature

  def user_name_full
    "#{self.last_name} #{self.first_name}".html_safe
  end

  private

  def signature_size_validation
    errors[:signature] << "deve pesare meno di: 1000KB" if signature.size > 1.0.megabytes
  end

  def validator_signature_size_validation
    errors[:validator_signature] << "deve pesare meno di: 1000KB" if signature.size > 1.0.megabytes
  end

  def confirmator_signature_size_validation
    errors[:confirmator_signature] << "deve pesare meno di: 1000KB" if signature.size > 1.0.megabytes
  end
end
