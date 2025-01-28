require "administrate/base_dashboard"

class ProductRuleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    product: Field::BelongsTo,
    id: Field::Number,
    condition: Field::Text.with_options(form: { as: :textarea }),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  COLLECTION_ATTRIBUTES = [
    :product,
    :condition,
  ].freeze


  # SHOW_PAGE_ATTRIBUTES
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  FORM_ATTRIBUTES = [
    :product,
    :condition,
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

  # Overwrite this method to customize how product rules are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product_rule)
  #   "ProductRule ##{product_rule.id}"
  # end
end
