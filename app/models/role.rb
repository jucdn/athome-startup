class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles


  belongs_to :resource,
             :polymorphic => true,
             :optional => true


  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def self.h_name(name)
    I18n.t(
        name,
        scope: 'activerecord.attributes.role.names'
    )
  end

  def human_name
    self.class.h_name(name)
  end

end
