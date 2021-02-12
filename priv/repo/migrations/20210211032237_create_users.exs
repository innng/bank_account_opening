defmodule BankAccount.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :binary
      add :email, :binary
      add :cpf, :binary, null: false
      add :birth_date, :date
      add :gender, :binary
      add :city, :binary
      add :state, :binary
      add :country, :binary
      add :referral_code, :integer
      add :is_completed, :boolean, default: false

      timestamps()
    end

  end
end
