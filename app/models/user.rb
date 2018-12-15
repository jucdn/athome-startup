class User < ActiveRecord::Base
  validates :phone, phone: { possible: true, allow_blank: true }
  rolify
  after_create :assign_default_role
  belongs_to :startup
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[slack]

  def name
   "#{first_name} #{last_name}"
  end

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  def self.find_for_slack_oauth(auth)

    puts auth.info.to_json

    registered_user = User.where(:uid => auth.uid).first
    unless registered_user.nil?
      # registered_user.name = auth.info.name if registered_user.name == nil
      # registered_user.avatar = auth.info.image if registered_user.avatar == nil
      # registered_user.uid = auth.uid if registered_user.id == nil
      # registered_user.skip_confirmation!
      # registered_user.save!
      registered_user
    else

      if !auth.info.deleted && !auth.info.is_restricted && auth.info.team_id == ENV['SLACK_TEAM_ID']
        user = User.new
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        if auth.info.email.nil?
          user.email = auth.info.nickname+"@athome-startup.fr"
        else
          user.email = auth.info.email
        end
        user.avatar = auth.info.image
        user.uid = auth.uid
        user.nickname = auth.info.nickname
        user.provider = auth.provider
        user.password = Devise.friendly_token[0,20]
        # user.skip_confirmation!
        user.save!
      end
      user
    end
  end

end
