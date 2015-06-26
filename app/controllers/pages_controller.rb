class PagesController < ApplicationController


  def about
  end

  def search
  	  	@news = News.all.order('created_at DESC').page(params[:page]).per(5)
  	    @vocabularies = Vocabulary.where(status: "approved").order('polish ASC').page(params[:page]).per(5)
  	    @theories = Theory.where(status: "approved").order('created_at DESC').page(params[:page]).per(5)
  	    @articles = Article.where(status: "approved").order('created_at DESC').page(params[:page]).per(5)
  	    @surveys = Survey::Survey.where(status: "approved").order('name ASC').page(params[:page]).per(10)
  	    @links = Link.where(status: "approved").order('title ASC').page(params[:page]).per(10)





   if params[:search]
      @articles = Article.where(status: "approved").search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
    else
      @articles = Article.where(status: "approved").order('created_at DESC').page(params[:page]).per(5)
    end



    if params[:search]
      @vocabularies = Vocabulary.where(status: "approved").search(params[:search]).order("polish ASC").page(params[:page]).per(5)
    else
      @vocabularies = Vocabulary.where(status: "approved").order("polish ASC").page(params[:page]).per(5)
    end




    if params[:search]
      @theories = Theory.where(status: "approved").search(params[:search]).order("created_at DESC").page(params[:page]).per(5)

    else
      @theories = Theory.where(status: "approved").order("created_at DESC").page(params[:page]).per(5)

    end

       if params[:search]
      @surveys = Survey::Survey.where(status: "approved").search(params[:search]).order("name ASC").page(params[:page]).per(10)   
    else
   @surveys = Survey::Survey.where(status: "approved").order('name ASC').page(params[:page]).per(10)
    end


   if params[:search]
      @links = Link.where(status: "approved").search(params[:search]).order('title ASC').page(params[:page]).per(10)
    else
      @links = Link.where(status: "approved").order('title ASC').page(params[:page]).per(10)
    end

end



  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ? OR url like ? OR description like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
 
  end


end
