class SubmissionMailer < ApplicationMailer
  def new_response
    @submission = params[:submission]
    @comment = params[:comment]

    mail to: @submission.user.email, subject: "New reponse on #{@submission.title} via webbit"
  end
end
