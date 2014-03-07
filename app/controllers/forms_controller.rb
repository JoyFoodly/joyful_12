class FormsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @form = Form.new(form_params)

    if @form.save
      redirect_to submitted_form_path('feedback')
    else
      flash.now[:error] = @form.errors.full_messages.first
      render :show
    end
  end

  def show
    @form = Form.new(user_name: current_user.full_name)
  end

  def submitted

  end

private

  def form_params
    params.require(:form).permit(:user_name, :response_type, :browser_type, :message, :course_useful,
                                 :course_useful_explanation, :photo, :testimonial, :approved_for_marketing)
  end

end
