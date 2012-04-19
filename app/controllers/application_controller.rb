class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
 
  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end
  
  # an application wide helper to respond when a requested object is not found (from the Fat Free CRM source code)
  #---------------------------------------------------------------------------------------------------------------
  def respond_to_not_found(*types)
    asset = self.controller_name.singularize
    flick = case self.action_name
      when "destroy" then "delete"
      when "promote" then "convert"
      else self.action_name
    end
    if self.action_name == "show"
      # If asset does exist, but is not viewable to the current user..
      if asset.capitalize.constantize.exists?(params[:id])
        flash[:warning] = t(:msg_asset_not_authorized, asset)
      else
        flash[:warning] = t(:msg_asset_not_available, asset)
      end
    else
      flash[:warning] = t(:msg_cant_do, :action => flick, :asset => asset)
    end
    respond_to do |format|
      format.html { redirect_to :action => :index } if types.include?(:html)
      format.js { render(:update) { |page| page.reload } } if types.include?(:js)
      format.json { render :text => flash[:warning], :status => :not_found } if types.include?(:json)
      format.xml { render :text => flash[:warning], :status => :not_found } if types.include?(:xml)
    end
  end
  
end
