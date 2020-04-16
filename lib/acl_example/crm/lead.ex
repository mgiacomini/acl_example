defmodule AclExample.Crm.Lead do
  alias AclExample.CustomerManagement.Proposal

  defstruct [:id, :external_id, :proposal_id]

  def to_proposal(%Lead{} = lead) do
    %Proposal{}
  end
end
