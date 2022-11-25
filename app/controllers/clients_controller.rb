class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
# [:show, :index, :update]

    def index
        render json: Client.all
    end

    def show
        client = find_client
        render json: client
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: :accepted
    end
    
    private
    def find_client
        Client.find_by!(id: params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end
    
    def record_not_found
        render json: {error: "Client not found"}, status: :not_found
    end
    
    def unprocessable_entity_method(exception)
        render json: {errors: exception.record.errors}, status: :unprocessable_entity
    end
end
