defmodule AclExample.Crm.Opportunity do
  alias AclExample.CustomerManagement.Proposal

  defstruct [:id, :external_id, :proposal_id]

  def to_proposal(%Opportunity{} = opportunity) do
    %Proposal{}
  end
end
