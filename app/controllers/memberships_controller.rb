class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # [:create, :index, :update]
    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    def index
        render json: Membership.all
    end

    def update
        membership = find_membership
        membership.update!(membership_params)
        render json: membership, status: :accepted
    end

    private
    def find_membership
        Membership.find_by!(id: params[:id])
    end

    def membership_params
        params.permit(:client_id, :gym_id, :charge)
    end

    def record_not_found
        render json: {error: "Membership not found"}, status: :not_found
    end

    def unprocessable_entity_method e
        render json: {error: e.record.errors}, status: :unprocessable_entity
    end
end
