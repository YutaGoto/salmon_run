# NotFound 404
class NotFoundException < StandardError; end

# Gone 410
class GoneException < StandardError; end

# Input Error
class InputErrorException < StandardError; end

# Application Error 500
class ApplicationException < StandardError; end

# Auth Error 401
class AuthorityException < StandardError; end

# Maintenance 503
class MaintenanceException < StandardError; end

# Conflict (only API)
class ConflictException < StandardError; end
