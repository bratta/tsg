module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    
    def redcloth(tainted_string = "")
      RedCloth.new(tainted_string, [ :sanitize_html ] ).to_html
    end
  end
end
