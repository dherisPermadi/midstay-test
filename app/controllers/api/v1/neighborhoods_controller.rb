module Api
  module V1
    class NeighborhoodsController < ApplicationController
      before_action :set_neighborhood, only: %i[show update destroy]

      def index
        @neighborhoods      = Neighborhood.ransack(params[:q]).result
        @neighborhoods      = @neighborhoods.page(params[:page] || 1).per(params[:per_page] || 10)
        serial_neighborhood = @neighborhoods.map { |neighborhood| NeighborhoodSerializer.new(neighborhood, root: false) }

        response_pagination(serial_neighborhood, @neighborhoods, 'Neighborhood List')
      end

      def show
        response_success('Neighborhood', NeighborhoodSerializer.new(@neighborhood))
      end

      def create
        neighborhood = Neighborhood.new(neighborhood_params)

        if neighborhood.save
          response_success('Add New Neighborhood Succeed', NeighborhoodSerializer.new(neighborhood), 201)
        else
          response_error('Add New Neighborhood Failed', neighborhood.errors.full_messages)
        end
      end

      def update
        if @neighborhood.update(neighborhood_params)
          response_success('Update Neighborhood Succeed', NeighborhoodSerializer.new(@neighborhood))
        else
          response_error('Update Neighborhood Failed', @neighborhood.errors.full_messages)
        end
      end

      def destroy
        return unless @neighborhood.destroy

        response_success('Delete Neighborhood Succeed')
      end

      private

      def set_neighborhood
        @neighborhood = Neighborhood.find(params[:id])
      rescue StandardError
        response_error('Neighborhood Error', 'Data not found')
      end

      def neighborhood_params
        params.require(:neighborhood)
              .permit(:name, :longitude, :latitude, :criteria)
      end
    end
  end
end
