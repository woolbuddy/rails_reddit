class SubsController < ApplicationController
  # M(model) - all logic on the table or record, restraints
  # V(views) - user interaction, logic at minimum
  # C(controllers / routes) - directs traffic, actions 

  # CRUD -> HTTP VERBS

  # Create -> POST
  # Read -> GET
  # Update -> PATCH / PUT
  # Destroy -> DELETE

  # All actions must return a response
    # HTML JSON XML or redirect to another action that does sit

  # READ / GET
    # User sees
    # Show all records inside of the table
    # index action
    #   @model_names = Model_name.all

    # single record - id
    #   show action
    #     @model_name = Model_name.find(params[:id])

    # new - show the new record form , create the record in memory
    #   new action
    #     @model_name = Model_name.new

    # edit - show the update form, id
    #   edit action
    #     @model_name = Model_name.find(params[:id])

  # CREATE / POST
    # create a record, must have a new action / form
    #  create action
    #   @model_name = Model_name.new(model_name_params)

    #   if @model_name.save
    #     do something
    #     else
    #       render :new
    #     end
  
  # UPDATE / PUT PATCH
    # edit a record, must have an edit action / form, id
    #   update action
    #    @model_name = Model_name.find(params[:id])
    #    if @model_name.update(model_name_params)
    #     do something
    #     else
    #       render :edit
    #     end

  # DESTROY / DELETE
    #  delete a record, id
    #   destroy action

    #   Model_name.find(params[:id]).destroy
    #   do something


  # model_name_params
  #     pass certain attr
    
    # private
    #   def model_name_params
    #       params.require(:model_name).permit(:attr, :everything the table has, :col)
    #   end

  # partials are common views pages

    # CALLBACKS
    #   perform logic at a specific event / action
    #   before_action
    #   after_action
    #   skip_before_action
    #   skip_after_action
    #                                   except:
    #   before_action :method_to_call,  only: [:index, :show]

  before_action :set_sub, only: [:show, :edit, :update, :destroy] 
  def index
    #render index.html.erb
    @subs = Sub.all
  end

  def show
    # @sub = Sub.find(params[:id]) 
  end

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    # @sub =Sub.find(params[:id])
    render partial: 'form'
  end

  def update
    # @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private
    def set_sub
      @sub = Sub.find(params[:id])
    end

    def sub_params
        params.require(:sub).permit(:name)
    end
end

