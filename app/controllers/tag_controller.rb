class TagController < ApplicationController
  
  def show
	  @tag = Tag.find(params[:id])
	  @jobs = Job.tagged_with(@tag.name)
  end

end
