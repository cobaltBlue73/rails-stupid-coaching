# frozen_string_literal: true

class QuestionsController < ApplicationController
  def ask; end

  def answer
    p params
    @question = params[:question]
    @answer = coach_answer_enhanced(@question)
  end

  private

  def coach_answer(your_message)
    if your_message.downcase.capitalize == 'I am going to work right now!'
      ''
    elsif your_message.end_with?('?')
      'Silly question, get dressed and go to work!'
    else
      "I don't care, get dressed and go to work!"
    end
  end

  def coach_answer_enhanced(your_message)
    ans = coach_answer(your_message)
    ans = 'I can feel your motivation! ' + ans if your_message == your_message.upcase && !ans.empty?
    ans
  end
end
