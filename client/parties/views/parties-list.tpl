<ion-view view-title="Home" hide-back-button="true">
    <ion-content scroll="true">
        <div ng-controller="PartiesListCtrl">
            <meteor-include src="loginButtons"></meteor-include>
            <div class="card">
                <div class="item item-divider">
                    New Party
                </div>
                <div class="item item-text-wrap">
                    <form>
                        <label>Name</label>
                        <input ng-model="newParty.name">
                        <label>Description</label>
                        <input ng-model="newParty.description">
                        <label>Public</label>
                        <input type="checkbox" ng-model="newParty.public">
                        <button ng-click="newParty.owner=$root.currentUser._id; parties.push(newParty);newParty={};">Add</button>                    </form>
                </div>
                <div class="item item-divider">
                    My Parties
                    <button ng-click="newParty.owner=$root.currentUser._id; parties.push(newParty)">Add</button>
                </div>
                <div class="item item-text-wrap">
                    <ul class="list">
                        <li class="item" dir-paginate="party in parties | itemsPerPage: perPage" total-items="partiesCount.count">
                            <a href="/parties/{{party._id}}">{{party.name}}</a>

                            <p>{{party.description}}</p>
                            <button ng-click="remove(party)">X</button>
                        </li>
                    </ul>
                    <dir-pagination-controls on-page-change="pageChanged(newPageNumber)"></dir-pagination-controls>
                </div>
                <div class="item item-divider">
                    <p>v.29</p>
                </div>
            </div>
        </div>
    </ion-content>
</ion-view>