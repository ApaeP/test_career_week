module DateRangeValidator
  extend ActiveSupport::Concern

  included do
    validates :start_date, :end_date, presence: true
    validate :start_date_before_end_date
  end

  private

  def start_date_before_end_date
    return unless start_date.present? && end_date.present?
    return if start_date < end_date

    errors.add(:base, 'Start date should be before end date')
  end
end
