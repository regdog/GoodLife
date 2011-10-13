class FeatsController < ApplicationController
  def index
    if params[:type]
      @category = Category.feats.find_by_name(params[:type]) if params[:type]
      if @category
        @feats = @category.feats
      end
    else
      redirect_to all_feats_path
    end
  end

  def all
    @feats = Feat.all
    render :index
  end

  def show
    @feat = Feat.find(params[:id])
    render :layout => 'corp'
  end

  def checkin
    unless params[:feat_id].blank?
      @checkin = Checkin.new
      @checkin.feat_id = params[:feat_id]
      @checkin.user_id = current_user.id
      if @checkin.save
        @feat = @checkin.feat
        @feat.done_count = @feat.done_count + 1
        @feat.save
      end
    end
    redirect_to :back
  end
end
