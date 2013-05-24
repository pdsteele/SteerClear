class PagesController < ApplicationController
  #for static pages!

  def home #for home page
    @numShifts = Shift.activeShifts.count
    if @numShifts != 0
      flash[:success] = "Steer Clear is current accepting ride requests with " + @numShifts + " vans operating! Log in and request a ride!"
    else
      flash[:notice] = "Steer Clear is currently closed and not accepting any ride requests :( Please check the about page for our hours of operation."
    end
  end

  def about #about page
  end

  def contact #contact us page
  end

  def employeeinfo
  end

  def download_bylaws
    send_file 'public/ConstitutionBylaws.pdf', :type=>"application/pdf", :x_sendfile=>true
  end

  def download_payroll
    send_file 'public/PayrollProcess2012.doc', :type=>"application/doc", :x_sendfile=>true
  end

  def download_training
    send_file 'public/TrainingEmploymentPacket2012-13.docx', :type=>"application/docx", :x_sendfile=>true
  end

  def download_contract
    send_file 'public/HiringContract.doc', :type=>"application/doc", :x_sendfile=>true
  end

end
