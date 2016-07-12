module Remindrr
  class Error        < StandardError; end
  class Unauthorized < Error; end
  class NotFound     < Error; end
  class BadRequest   < Error; end
end
