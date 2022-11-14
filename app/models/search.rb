# frozen_string_literal: true

class Search < ApplicationRecord
  def search_alumni
    alumni = User.all

    alumni = alumni.where(['first_name LIKE ? OR lower(first_name) LIKE ?', "%#{first_name}%", "%#{first_name}%"]) if first_name.present?

    alumni = alumni.where(['last_name LIKE ? or lower(last_name) LIKE ?', "%#{last_name}%", "%#{last_name}%"]) if last_name.present?

    if major.present?
      # alumni = Major.where(["name LIKE ?", "%#{major.name}%"])
      alumni = alumni.where(major_id: Integer(major))
    end

    alumni = alumni.where(graduation_year: graduation_year) if graduation_year.present?

    if job_category.present?
      job_id = JobCategory.select(:id).where(name: job_category)
      alum_id = Alumnus.select(:user_id).where(job_category_id: job_id)
      alumni = alumni.where(id: alum_id)
    end

    if job_title.present?
      alum_id = Alumnus.select(:user_id).where(['job_title LIKE ? or lower(job_title) LIKE ?', "%#{job_title}%", "%#{job_title}%"])
      alumni = alumni.where(id: alum_id)

    end

    if employer.present?
      alum_id = Alumnus.select(:user_id).where(['employer LIKE ? or lower(employer) LIKE ?', "%#{employer}%", "%#{employer}%"])
      alumni = alumni.where(id: alum_id)
    end

    alumni
  end
end
