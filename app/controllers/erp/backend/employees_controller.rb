module Erp
  module Backend
    class EmployeesController < Erp::Backend::BackendController
      before_action :set_employee, only: [:archive, :unarchive, :edit, :update, :destroy]
  
      # GET /employees
      def index
      end
  
      # POST /employees/list
      def list
        @employees = Employee.search(params).paginate(:page => params[:page], :per_page => 10)
        
        render layout: nil
      end
  
      # GET /employees/new
      def new
        @employee = Employee.new
      end
  
      # GET /employees/1/edit
      def edit
      end
  
      # POST /employees
      def create
        @employee = Employee.new(employee_params)
  
        if @employee.save
          if request.xhr?
            render json: {
              status: 'success',
              text: @employee.code,
              value: @employee.id
            }
          else
            redirect_to erp.edit_backend_employee_path(@employee), notice: t('.success')
          end
        else
          render :new        
        end
      end
  
      # PATCH/PUT /employees/1
      def update
        if @employee.update(employee_params)
          if request.xhr?
            render json: {
              status: 'success',
              text: @employee.code,
              value: @employee.id
            }              
          else
            redirect_to erp.edit_backend_employee_path(@employee), notice: t('.success')
          end
        else
          render :edit
        end
      end
  
      # DELETE /employees/1
      def destroy
        @employee.destroy

        respond_to do |format|
          format.html { redirect_to erp_products.backend_employees_path, notice: t('.success') }
          format.json {
            render json: {
              'message': t('.success'),
              'type': 'success'
            }
          }
        end
      end      
      
      # DATASELECT
      def dataselect
        respond_to do |format|
          format.json {
            render json: Employee.dataselect(params[:keyword])
          }
        end
      end
  
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_employee
          @employee = Employee.find(params[:id])
        end
  
        # Only allow a trusted parameter "white list" through.
        def employee_params
          params.fetch(:employee, {}).permit(:code, :birthdate, :salary, :tax_code, :phone, :address)
        end
    end
  end
end