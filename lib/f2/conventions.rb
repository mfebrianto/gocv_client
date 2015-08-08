module F2

  class Conventions

    def self.date(current_date)
      Rails.logger.info ">>date>>#{current_date.strftime('%d/%m/%y')}"
      return current_date.strftime('%d/%m/%y') if current_date.present?
    end

  end

end