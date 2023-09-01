class ProtocolsController < ApplicationController
    before_action :set_protocol, only: %i[ show ]

    def show
        @protocol = Protocol.new(id: params[:student_id])
        @student = Student.find_by(id: params[:student_id])
        puts params[:student_id]
        respond_to do |format|
            format.html
            format.pdf do
              render pdf: "file_name", template: "protocols/show".html_safe, layout: "application", formats: [:html], :encoding => 'UTF-8', style: "protocols.scss"
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_protocol
        @protocol = Protocol.new(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def protocol_params
        params.fetch(:protocol, {}).permit(:student_id)
    end

end
