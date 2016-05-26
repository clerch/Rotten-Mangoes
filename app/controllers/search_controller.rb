class SearchController < ApplicationController
  
  def index
      #   case params[:movie]
  #     Movie.where("movie")
    #Plant.find_by(id: params[:plant_id])
    #Movie.where("params[:movie] LIKE ?", )
    # @movies = Movie.where("title LIKE ? or director LIKE ?", "%#{params[:title]}%", "%#{params[:director]}%")

    # you should use when chaining
    @movies = Movie.all

    if (params[:search].present?) 
      @movies = @movies.where("title LIKE ? or director LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # if (params[:director].present?) 
    #   @movies = @movies.where("title LIKE ?", params[:director])
    # end

    if (params[:runtime_in_minutes].present?) 
      case params[:runtime_in_minutes]
      when "all"
        @movies
      when "under_90_minutes"
        @movies = @movies.where("runtime_in_minutes < 90")
      when "between_90_and_120_minutes"
        @movies = @movies.where("90 < runtime_in_minutes < 120")
      when "over_120_minutes"
        @movies = @movies.where("runtime_in_minutes > 120")
      end
    end


  end
end
