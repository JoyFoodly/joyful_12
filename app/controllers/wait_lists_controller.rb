class WaitListsController < ApplicationController

  def new
    @wait_list = WaitList.new
  end

  def create
    @wait_list = WaitList.new(wait_list_params)

    if @wait_list.save
      redirect_to wait_list_path('added'), notice: I18n.t('wait_list.added')
    else
      render :new
    end
  end

  def show

  end

private

  def wait_list_params
    params.require(:wait_list).permit(:first_name, :last_name, :email, :newsletter)
  end

end
