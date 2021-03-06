class SettingsController < ApplicationController

@isAdmin = false;
@isSecretary = false;
@isOthers = false;

  def settings
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]
	@user = User.find_by(emailadd: params[:emailadd])
	@job_title = "#{@user.job_title}"

	if(@job_title == "Admin")
	  @isAdmin = true
	elsif(@job_title == "Secretary")
	  @isSecretary = true
	elsif(@job_title == "Dean")
	  @isOthers = true
	else
      @isOthers = true
	  @doc = Forward.select(:doc_id).where(:user_id => "#{@user.id}")
	  @folders = Document.select(:doc_type).where(:id => "#{@doc}").distinct
	end
	
	@doc_type = Doctype.all
    @users = User.all
	@jobtitle = Jobtitle.all
  end

  def add_doctype
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]
	@user = User.find_by(emailadd: params[:emailadd])
	@job_title = "#{@user.job_title}"

	if(@job_title == "Admin")
	  @isAdmin = true
	elsif(@job_title == "Secretary")
	  @isSecretary = true
	elsif(@job_title == "Dean")
	  @isOthers = true
	else
      @isOthers = true
	  @doc = Forward.select(:doc_id).where(:user_id => "#{@user.id}")
	  @folders = Document.select(:doc_type).where(:id => "#{@doc}").distinct
	end

    if params[:doctype] != nil
	  @doc_type = Doctype.new(doctype_params)
	  if !(@doc_type.save)
	    flash[:taken] = "Name has already been taken. Please enter a unique name!"
	  else
	    flash[:notice] = "The document type was successfully added!"
	    redirect_to settings_path(emailadd: params[:emailadd])
	  end
	end
  end

  def delete_doctype
    @emailadd = params[:emailadd]
    @doc = Doctype.find(params[:id])
	Doctype.delete(@doc)

	flash[:notice] = "The document type was successfully deleted!"
	redirect_to settings_path(emailadd: params[:emailadd])
  end

  def edit_doctype
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]
	@user = User.find_by(emailadd: params[:emailadd])
	@job_title = "#{@user.job_title}"

	if(@job_title == "Admin")
	  @isAdmin = true
	elsif(@job_title == "Secretary")
	  @isSecretary = true
	elsif(@job_title == "Dean")
	  @isOthers = true
	else
      @isOthers = true
	  @doc = Forward.select(:doc_id).where(:user_id => "#{@user.id}")
	  @folders = Document.select(:doc_type).where(:id => "#{@doc}").distinct
	end

    @doc_id = params[:id]
    @doctype = Doctype.find(params[:id])
  end

  def update_doctype
	@folders = Document.select(:doc_type).distinct
    doc = Doctype.find(params[:doctype_id])
	doc.update(name: params[:doctype_name])

	flash[:notice] = "The document type was successfully updated!"
	redirect_to settings_path(emailadd: params[:emailadd])
  end

  def add_jobtitle
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]
	@user = User.find_by(emailadd: params[:emailadd])
	@job_title = "#{@user.job_title}"

	if(@job_title == "Admin")
	  @isAdmin = true
	elsif(@job_title == "Secretary")
	  @isSecretary = true
	elsif(@job_title == "Dean")
	  @isOthers = true
	else
      @isOthers = true
	  @doc = Forward.select(:doc_id).where(:user_id => "#{@user.id}")
	  @folders = Document.select(:doc_type).where(:id => "#{@doc}").distinct
	end

    if params[:name] != nil
	  @jobtitle = Jobtitle.new(name: params[:name])

	  if !(@jobtitle.save)
	    flash[:taken] = "Name has already been taken. Please enter a unique name!"
	  else
	    flash[:notice] = "The job title was successfully added!"
	    redirect_to settings_path(emailadd: params[:emailadd])
	  end
	end
  end

  def delete_jobtitle
    @emailadd = params[:emailadd]
    @job = Jobtitle.find(params[:id])
	Jobtitle.delete(@job)

	flash[:notice] = "The job title was successfully deleted!"
	redirect_to settings_path(emailadd: params[:emailadd])
  end

  def edit_jobtitle
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]
	@user = User.find_by(emailadd: params[:emailadd])
	@job_title = "#{@user.job_title}"

	if(@job_title == "Admin")
	  @isAdmin = true
	elsif(@job_title == "Secretary")
	  @isSecretary = true
	elsif(@job_title == "Dean")
	  @isOthers = true
	else
      @isOthers = true
	  @doc = Forward.select(:doc_id).where(:user_id => "#{@user.id}")
	  @folders = Document.select(:doc_type).where(:id => "#{@doc}").distinct
	end

    @job_id = params[:id]
    @jobtitle = Jobtitle.find(params[:id])
  end

  def update_jobtitle
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]
    job = Jobtitle.find(params[:jobtitle_id])
	job.update(name: params[:jobtitle_name])

	flash[:notice] = "The job title was successfully updated!"
	redirect_to settings_path(emailadd: params[:emailadd])
  end

   def edit_users
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]
	@current_user = User.find_by(emailadd: params[:emailadd])
	@job_title = "#{@current_user.job_title}"

	if(@job_title == "Admin")
	  @isAdmin = true
	elsif(@job_title == "Secretary")
	  @isSecretary = true
	elsif(@job_title == "Dean")
	  @isOthers = true
	else
      @isOthers = true
	  @doc = Forward.select(:doc_id).where(:user_id => "#{@user.id}")
	  @folders = Document.select(:doc_type).where(:id => "#{@doc}").distinct
	end

	session[:emailadd] = @emailadd
	@user_edit = User.find(params[:id])
    @jobtitle = Jobtitle.find_by_sql("SELECT * FROM jobtitles where name != '#{@user_edit.job_title}'")
  end

  def update_users
	@folders = Document.select(:doc_type).distinct
    @emailadd = params[:emailadd]

    current_user = User.find_by(emailadd: params[:user_emailadd])
	current_user.update(job_title: params[:job_title])

	flash[:notice] = "Profile successfully updated!"
	redirect_to settings_path(emailadd: params[:emailadd])
  end

  def delete_users
    @emailadd = params[:emailadd]
    @user = User.find(params[:id])
	User.delete(@user)

	flash[:notice] = "The user was successfully deleted!"
	redirect_to settings_path(emailadd: params[:emailadd])
  end

  def doctype_params
    params.require(:doctype).permit(:name)
  end
end
