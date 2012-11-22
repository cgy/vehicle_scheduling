module Admin
  class GroupsController < BaseController
    # GET /groups
    # GET /groups.json
    def index
      @groups = Group.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @groups }
      end
    end
  end
end
