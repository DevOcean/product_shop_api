require "administrate/base_dashboard"

class OptionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    part: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    in_stock: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :part,
    :in_stock,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  FORM_ATTRIBUTES = [
    :part,
    :name,
    :in_stock,
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how options are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(option)
  #   "Option ##{option.id}"
  # end
end
