module Vendor

  def vendor_name(name)
    self.vendor = name
  end

  def get_vendor_name
    self.vendor
  end

  protected
  attr_accessor :vendor
end
