defmodule DatalyticsWeb.Pow.Mailer do
  use Pow.Phoenix.Mailer
  use Bamboo.Mailer, otp_app: :datalytics
  require Logger

  import Bamboo.Email

  @impl true
  def cast(%{user: user, subject: subject, text: text, html: html, assigns: _assigns}) do
    new_email(
      to: user.email,
      from: "datalytics",
      subject: subject,
      html_body: html,
      text_body: text
    )
  end

  @impl true
  def process(email) do

    deliver_later(email)
  end

  def process(email) do
    Logger.debug("E-mail send: #{inspect(email)}")
  end
end
