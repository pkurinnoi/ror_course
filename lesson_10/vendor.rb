# frozen_string_literal: true

module Vendor
  def vendor_name(name)
    self.vendor = name
  end

  protected

  attr_accessor :vendor
end
