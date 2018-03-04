import { Pipe, PipeTransform } from '@angular/core';

import { IProviderAndProviderAvailableShift } from '../shared/interfaces';

@Pipe({
  name: 'providerShiftFilter',
  pure: false
})
export class ProviderShiftFilterPipe implements PipeTransform {
  transform(items: IProviderAndProviderAvailableShift[], filter: IProviderAndProviderAvailableShift): IProviderAndProviderAvailableShift[] {
    if (!items || !filter) {
      return items;
    }
    // filter items array, items which match and return true will be kept, false will be filtered out
    return items.filter((item: IProviderAndProviderAvailableShift) => this.applyFilter(item, filter));
  }

  /**
   * Perform the filtering.
   * 
   * @param {ProviderAvailableShift}  The providerShift to compare to the filter.
   * @param {providerAvailableShift} filter The filter to apply.
   * @return {boolean} True if book satisfies filters, false if not.
   */
  applyFilter(providerAvailableShift: IProviderAndProviderAvailableShift, filter: IProviderAndProviderAvailableShift): boolean {
    for (let field in filter) {
      if (filter[field]) {
        if (typeof filter[field] === 'string') {
          if (providerAvailableShift[field].toLowerCase().indexOf(filter[field].toLowerCase()) === -1) {
            return false;
          }
        } else if (typeof filter[field] === 'number') {
          if (providerAvailableShift[field] !== filter[field]) {
            return false;
          }
        }
      }
    }
    return true;
  }
}
