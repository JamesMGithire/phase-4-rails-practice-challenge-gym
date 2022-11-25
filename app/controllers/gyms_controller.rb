class GymsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # [:show, :delete, :index, :update]

    def index
        render json: Gym.all
    end

    def show
        gym = find_gym
        render json: gym
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym, status: :accepted
    end

    def delete
        gym = find_gym
        gym.destroy
        render status: :no_content
    end

    
    private
    def find_gym
        Gym.find_by!(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end

    def record_not_found
        render json: { error: 'Gym not found'}, status: :not_found
    end

    def unprocessable_entity_method e
        render json: { error: e.record.errors }, status: :unprocessable_entity
    end
end
