module CB
  module Client
    module Mappers
      class Resume
        class << self
          CREATE_ELEMENTS_WITH_CHILDREN = [
            :languages,
            :educations,
            :custom_values,
            :company_experiences
          ]

          def build_create_request(criteria)
            xml = Builder::XmlMarkup.new
            xml.Request do |r|
              r.DeveloperKey @options[:developer_key]
              r.Test         @options[:test] ? 'true' : 'false'

              # Copy leaves
              criteria.select { |k| !CREATE_ELEMENTS_WITH_CHILDREN.include?(k) }.each do |k, v|
                r.__send__(k.to_s.camelize, v)
              end

              r.Languages do |languages|
                (criteria[:languages] || []).each do |criteria_value|
                  languages.Language(criteria_value)
                end
              end

              r.Educations do |educations|
                (criteria[:educations] || []).each do |criteria_value|
                  educations.Education do |e|
                    e.SchoolName     criteria_value[:school_name]
                    e.Major          criteria_value[:major]
                    e.DegreeCode     criteria_value[:degree_code]
                    e.GraduationDate criteria_value[:graduation_date] if criteria_value[:graduation_date]
                    e.GPA            criteria_value[:gpa]             if criteria_value[:gpa]
                  end
                end
              end

              r.CustomValues do |custom_values|
                (criteria[:custom_values] || []).each do |criteria_value|
                  custom_values.CustomValue do |c|
                    c.Key   criteria_value[:key]
                    c.Value criteria_value[:value]
                  end
                end
              end

              r.CompanyExperiences do |company_experiences|
                (criteria[:company_experiences] || []).each do |criteria_value|
                  company_experiences.CompanyExperience do |c|
                    c.CompanyName criteria_value[:company_name]
                    c.JobTitle    criteria_value[:job_title]
                    c.StartDate   criteria_value[:start_date]
                    c.EndDate     criteria_value[:end_date]
                    c.Details     criteria_value[:details]
                  end
                end
              end

              r.Relocations do |relocations|
                (criteria[:relocations] || []).each do |criteria_value|
                  relocations.Relocation do |relocation|
                    relocation.WorkStatus criteria_value[:work_status]
                    relocation.City       criteria_value[:city]
                    relocation.State      criteria_value[:state]
                    relocation.Country    criteria_value[:country]
                    relocation.Zipcode    criteria_value[:zipcode]
                  end
                end
              end
            end

            xml.target!
          end
        end
      end
    end
  end
end
