# HelloWorldApp defintion
# EnsureJsonResponse defintion
# Timer definition

require "./6-middleware.rb"

use Timer
use EnsureJsonResponse
run HelloWorldApp