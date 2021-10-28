module Api
  module V1
    class FlatsController < ApplicationController
      before_action :set_flat, only: %i[show update destroy]

      def index
        @flats      = Flat.ransack(params[:q]).result
        @flats      = @flats.page(params[:page] || 1).per(params[:per_page] || 10)
        serial_flat = @flats.map { |flat| FlatSerializer.new(flat, root: false) }

        response_pagination(serial_flat, @flats, 'Flat List')
      end

      def show
        response_success('Flat', FlatSerializer.new(@flat))
      end

      def create
        flat = Flat.new(flat_params)

        if flat.save
          response_success('Add New Flat Succeed', FlatSerializer.new(flat), 201)
        else
          response_error('Add New Flat Failed', flat.errors.full_messages)
        end
      end

      def update
        if @flat.update(flat_params)
          response_success('Update Flat Succeed', FlatSerializer.new(@flat))
        else
          response_error('Update Flat Failed', @flat.errors.full_messages)
        end
      end

      def destroy
        return unless @flat.destroy

        response_success('Delete Flat Succeed')
      end

      private

      def set_flat
        @flat = Flat.find(params[:id])
      rescue StandardError
        response_error('Flat Error', 'Data not found')
      end

      def flat_params
        params.require(:flat)
              .permit(:name, :address, :longitude, :latitude)
      end
    end
  end
end
