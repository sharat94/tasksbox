# Preview all emails at http://localhost:3000/rails/mailers/anounce
class AnouncePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/anounce/completed
  def completed
    Anounce.completed
  end

end
