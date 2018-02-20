class ProjectMailer < ApplicationMailer
  default from: "username@gmail.com"

  def notify_admin(project)
    @project = project
    mail(to: "someone@example.com", subject: "Project created")
  end
end
