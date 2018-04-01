class FiguresController < ApplicationController


  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  post'/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmark << Landmark.create(params[:landmark])
    end

    if !param[:title][:name].empty?
      @figure.title << Title.create(params [:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmark << Landmark.create(params[:landmark])
    end

    if !param[:title][:name].empty?
      @figure.title << Title.create(params [:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


  delete '/figures/:id/delete' do
    @figure = Figure.find_by_id(params[:id])
    @figure.delete
    redirect to '/figures'
  end


end
