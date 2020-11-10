namespace :import do
  desc "Import bank data"
  task data: :environment do
    file_path = File.join(Rails.root, 'public','world_program.csv')
    csv_text = File.read(file_path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each_with_index do |row, i|
      ActiveRecord::Base.transaction do
        row_hash = row.to_hash
        BankBudget.find_or_create_by(
          work_program_group: row["Work Program Group"],
          work_program: row["Work Program"],
          unit: row["Unit"],
          fiscal_year: row["Fiscal Year"],
          bank_budget: row["Bank Budget (BB) (US$, Millions)"],
          all_funds: row["All Funds (US$, Millions)"],
          notes: row["Notes"]
        )
      end
    end
  end
end
#<CSV::Row "Work Program Group":"Institutional, Governance and Administrative Services" "Work Program":"Institutional Services" "Unit":"International Centre for Settlement of Investment Disputes" "Fiscal Year":"2015" "Bank Budget (BB) (US$, Millions)":"2.2" "All Funds (US$, Millions)":"2.2" "Notes":"World Bank's contribution to the funding for the International Centre for Settlement of Investment Disputes.">