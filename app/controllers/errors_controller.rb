class ErrorsController < ApplicationController
  skip_after_action :verify_authorized


   def not_found
     respond_to do |format|
       format.html { render status: 404 }
       format.json { render json: { error: "Resource not found" }, status: 404 }
     end
   end

   def internal_error
     respond_to do |format|
       format.html { render status: 500 }
       format.json { render json: { error: "Internal server error" }, status: 500 }
     end
   end
end
