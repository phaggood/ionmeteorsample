<ion-view view-title="Detail" hide-back-button="true">
    <ion-content>

        <div class="card">
            <div class="item item-divider">
                Party Details:
            </div>
            <div class="item item-text-wrap">
                <input ng-model="party.name">
                <input ng-model="party.description">
                <label>Is public</label>
                <input type="checkbox" ng-model="party.public">
            </div>
            <div class="item item-divider">
                Users
            </div>
            <div class="item item-text-wrap">
                <ul>
                    <li ng-repeat="user in users">
                        <div>{{ user.emails[0].address }}</div>
                    </li>
                </ul>
            </div>

            <div class="item item-divider">
                <button ng-click="save()">Save</button>
                <button ng-click="reset()">Reset form</button>
                <button><a href="/parties">Cancel</a></button>
            </div>
        </div>
    </ion-content>
</ion-view>
