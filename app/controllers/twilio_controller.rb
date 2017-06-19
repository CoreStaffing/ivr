#in dev
require 'twilio-ruby'
require 'sanitize'


class TwilioController < ApplicationController
  
  def index
    render text: "Dial Me."
  end

  # POST ivr/welcome
  def ivr_welcome
    response = Twilio::TwiML::Response.new do |r|
      r.Gather numDigits: '1', action: menu_path do |g|
        g.Play "https://drive.google.com/uc?export=download&id=0B76bM8uoub8eS1Vnb3NwZXA4NEk", loop: 3
      end
    end
    render text: response.text
  end

  # GET ivr/selection
  def menu_selection
    user_selection = params[:Digits]

    case user_selection
    when "1"
      twiml_dial("+14434003347")
    when "2"
      twiml_dial("+14434003347")
    when "3"
      connect_info
    when "7"
    else
      @output = "Returning to the main menu."
      twiml_say(@output)
    end

  end

  # POST/GET ivr/planets 
  # planets_path
  def planet_selection
    user_selection = params[:Digits]

    case user_selection
    when "4"
      twiml_dial("+14434003347")
    when "5"
      twiml_dial("+13362545275")
    when "6"
      twiml_dial("+12024494677;700")
    else
      @output = "Returning to the main menu."
      twiml_say(@output)
    end
  end

  private

  def connect_info
    response = Twilio::TwiML::Response.new do |r|
      r.Gather numDigits: '1', action: planets_path do |g|
        g.Play "https://drive.google.com/uc?export=download&id=0B76bM8uoub8ea2Z4eWV0SGtxWGc", loop:3
      end
    end
    render text: response.text
  end

  def twiml_say(phrase, exit = false)
    # Respond with some TwiML and say something.
    # Should we hangup or go back to the main menu?
    response = Twilio::TwiML::Response.new do |r|
      r.Say phrase, voice: 'alice', language: 'en-GB'
      if exit 
        r.Say "Thank you for calling core staffing cooperative!"
        r.Hangup
      else
        r.Redirect welcome_path
      end
    end

    render text: response.text
  end

  def twiml_dial(phone_number)
    response = Twilio::TwiML::Response.new do |r|
      r.Dial phone_number
    end

    render text: response.text
  end
end